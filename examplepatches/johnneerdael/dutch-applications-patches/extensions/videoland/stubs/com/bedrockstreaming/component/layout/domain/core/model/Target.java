// Compile-only declaration of the inspected app ABI. Never packaged.
package com.bedrockstreaming.component.layout.domain.core.model;
public abstract class Target {
 public abstract static class Lock extends Target {
  public abstract Target b();
  public abstract static class RequireSubscriptionLock extends Lock {}
 }
 public abstract static class OptionalTargetLock extends Target { public abstract Target b(); }
}
