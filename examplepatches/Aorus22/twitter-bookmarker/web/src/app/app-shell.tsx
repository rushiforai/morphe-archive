import { Bookmark } from "lucide-react"
import { Link, NavLink, Outlet } from "react-router-dom"

import { ThemeToggle } from "@/app/theme-toggle"
import { cn } from "@/lib/utils"

/**
 * Persistent application shell (design spec §3.1).
 *
 * Owns the page gutter, the top navigation (brand mark, `Home` / `Collections`
 * links, theme toggle) and the routed content container. Phases 4–8 fill in the
 * page bodies and must not need to restructure this component.
 *
 * Deliberate deviations from the mockup, both recorded in the design spec §3.1
 * scope note and §7:
 *   - the nav search field is omitted (no endpoint; PRD-2 §28 scopes search to
 *     the collection page)
 *   - `Explore` is omitted (no such route or requirement)
 *   - the mobile hamburger is replaced by the two links themselves, because
 *     there are only two and a hamburger with no menu would be dead UI
 */
export function AppShell() {
  return (
    <div className="min-h-svh">
      <header className="mx-auto w-full max-w-[1440px] px-4 min-[1440px]:px-0 sm:px-8 lg:px-16">
        <nav
          aria-label="Primary"
          className="mt-6 flex h-[58px] w-full items-center gap-6 rounded-lg border border-border bg-surface px-3 shadow-nav"
        >
          <Link
            to="/"
            aria-label="Twitter Bookmarker"
            className="flex min-w-0 items-center gap-2.5 rounded-md outline-none focus-visible:ring-3 focus-visible:ring-ring/50"
          >
            <span
              aria-hidden="true"
              className="flex size-10 shrink-0 items-center justify-center rounded-md bg-grad-brand text-white"
            >
              <Bookmark className="size-5" fill="currentColor" />
            </span>
            {/* HARD-03: below `sm` the nav does not have room for the wordmark
                beside the logo, the two links and the theme controls, and the
                `truncate` fallback rendered `Tw…`. Hide it instead of
                truncating mid-word; the logo plus the link's aria-label keep the
                brand reachable and named. */}
            <span
              data-testid="app-wordmark"
              className="hidden truncate text-[15px] leading-[1.4] font-semibold text-ink sm:inline"
            >
              Twitter Bookmarker
            </span>
          </Link>

          <div className="flex items-center gap-6 text-xs leading-[1.4]">
            <NavLink
              to="/"
              end
              className={({ isActive }) =>
                cn(
                  "rounded-sm transition-colors outline-none focus-visible:ring-3 focus-visible:ring-ring/50",
                  isActive
                    ? "font-semibold text-accent"
                    : "font-medium text-muted hover:text-ink"
                )
              }
            >
              Home
            </NavLink>
            {/* Design spec §3.1: `Home` and `Collections` both resolve to `/`
                (there is no separate collections index route in PRD-2 §15). */}
            <Link
              to="/"
              className="rounded-sm font-medium text-muted transition-colors outline-none hover:text-ink focus-visible:ring-3 focus-visible:ring-ring/50"
            >
              Collections
            </Link>
          </div>

          <div className="ml-auto flex items-center gap-2">
            <ThemeToggle />
            <span
              aria-hidden="true"
              className="size-[34px] shrink-0 rounded-full bg-grad-brand"
            />
          </div>
        </nav>
      </header>

      <main className="mx-auto w-full max-w-[1440px] px-4 py-8 min-[1440px]:px-0 sm:px-8 lg:px-16">
        <div className="mx-auto w-full max-w-[1312px]">
          <Outlet />
        </div>
      </main>
    </div>
  )
}
