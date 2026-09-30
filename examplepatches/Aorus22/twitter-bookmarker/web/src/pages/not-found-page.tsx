import { Link } from "react-router-dom"

import { Button } from "@/components/ui/button"

/** Catch-all 404 route. */
export function NotFoundPage() {
  return (
    <section aria-labelledby="not-found-heading" className="py-16 text-center">
      <p className="text-[10px] leading-[1.4] font-semibold tracking-[0.12em] text-accent uppercase">
        404
      </p>
      <h1
        id="not-found-heading"
        className="mt-3 text-[28px] leading-[1.2] font-bold"
      >
        This page is not in your archive
      </h1>
      <p className="mx-auto mt-3 max-w-[420px] text-sm leading-[1.45] text-muted">
        The link may be stale, or the collection no longer exists.
      </p>
      <Button asChild variant="secondary" className="mt-6">
        <Link to="/">Back to gallery</Link>
      </Button>
    </section>
  )
}
