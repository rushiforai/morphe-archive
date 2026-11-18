# Architecture

## Purpose

Kero309x Patches is a multi-application patch bundle for the Morphe patching
framework. It targets the stock, unmodified builds of the applications it
declares support for, and it is developed independently: the framework is used
through its published contracts, and no patch code is taken from any other patch
collection.

Anghami was the first registered application; Ana Vodafone is the second.
Applications are declared one at a time in `AppRegistry`; the structure below is
what makes each addition a package change rather than a core change. The bundle
does not claim support for an application until it is registered.

## Layers

| Layer | Package | Responsibility | May depend on |
|---|---|---|---|
| Core | `app.keropatches.core` | Application metadata model, category taxonomy, validation rules | Framework types only |
| Registry | `app.keropatches.registry` | The list of supported applications and the ordered patch catalogue | Core, application packages |
| Shared | `app.keropatches.shared` | Behaviour that is genuinely identical across applications | Core, framework types |
| Application | `app.keropatches.<app>` | Compatibility data, fingerprints, patches | Core, Shared, framework types |

`Catalogue` and `PatchRegistry` are the metadata source the tests and the
verification task read. There is no separate tooling module; the framework
plugin produces the bundle.

Rules that keep this intact:

- Core never imports an application package.
- Registry is the only place that names concrete applications.
- An application package never imports another application package.
- Shared only contains code used by more than one application, and only when
  the behaviour is the same, not merely similar.

## How patches are discovered

The framework loads a bundle, scans its classes, and collects every public static
field, or public static zero-argument method, whose type is a `Patch`. There is
no central registration file, and adding one would not change discovery.

This project therefore treats "registration" as a metadata problem:

- `AppDefinition` describes an application once.
- `AppRegistry` lists the applications.
- A patch declares its compatibility by referencing the application's
  `compatibility` value, so a version bump is a one-line change.
- Tests validate the registry, the catalogue and the behaviour specs against the
  same definitions.

## Adding an application

1. Create `app.keropatches.<app>` with an `<App>App.kt` holding the package name,
   version targets, minimum SDK and signing certificate.
2. Add it to `AppRegistry` and add its catalogue entries. The registry test
   requires every registered application to have at least one catalogued patch.
3. Write behaviour specs in `docs/specs/<app>/`.
4. Derive fingerprints from the stock build. Never from another project.
5. Implement each patch against its spec.
6. Add a runtime extension module only if a behaviour cannot be expressed in
   bytecode alone. Extensions are per application and never shared by accident.

No step requires editing the core layer.

## Patch shape

Each behaviour lives in its own package and is split into three files:

```
<app>/<area>/<Behaviour>Spec.kt        names, description, category, options, defaults
<app>/<area>/<Behaviour>Fingerprints.kt  independent description of the target code
<app>/<area>/<Behaviour>Patch.kt       the patch itself
```

The split is deliberate. A fingerprint is a claim about the stock application
and can be tested on its own; the patch is a claim about what we change.

## Safety rules encoded in the build

- Every fingerprint carries a match assertion. A version drift must fail the
  patch with a clear message instead of silently editing the wrong method.
- Every mutation checks the register budget of the method it edits.
- Behaviour that changes server-facing identity or entitlement is never enabled
  by default without an explicit decision. That decision is recorded in
  `docs/decisions/0004-defaults.md`.

## Build and release

- Framework plugin and patcher API. The plugin emits Java 11 bytecode; the build
  itself runs on JDK 21.
- One patch module; applications are packages, not modules.
- The bundle manifest and the `.mpp` are build artefacts. The README catalogue
  mirrors `Catalogue.kt` and is updated in the same change as the patch.
- Release signing is opt-in, not enabled yet, and documented in
  `docs/architecture/release.md`.

## Deliberate non-goals

- No dependency on any other patch collection, helper library or template.
- No build-logic module until a second module genuinely needs it.
- No runtime library inside the bundle.
