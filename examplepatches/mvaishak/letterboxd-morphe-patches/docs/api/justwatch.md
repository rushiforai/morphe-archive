# JustWatch availability

The official JustWatch Partner API requires a partner token. Its integration
documentation asks for a branded link to the regional title page.

TMDB also provides JustWatch availability by country through its Watch
Providers API. That response supplies a TMDB watch-page link. The direct
provider title links used by this patch are in the JustWatch website response.

The patch uses the public JustWatch website's endpoint,
`POST https://apis.justwatch.com/graphql`. It returned HTTP 200 without
credentials for each read-only operation below in a live curl on November
14, 2026. The website endpoint is undocumented and has no public stability
guarantee.

## Regional catalog

`packages(country: US, platform: WEB)` returns `data.packages[]`.

```json
{"packageId":8,"clearName":"Netflix","icon":"/icon/207360008/{profile}/netflix.{format}"}
```

## Title search

`popularTitles(country: US, filter: {searchQuery: "The Matrix"}, first: 4)`
returns `data.popularTitles.edges[].node.content`. The Movie content
selection uses `country: US, language: "en"`.

```json
{"title":"The Matrix","originalReleaseYear":1999,"fullPath":"/us/movie/the-matrix","externalIds":{"tmdbId":"603","imdbId":"tt0133093"}}
```

## Availability

`url(fullPath: "/us/movie/the-matrix")` returns `data.url.node`. The
`offers(country: US, platform: WEB)` selection on Movie contains entries
like this one.

```json
{"standardWebURL":"https://tv.youtube.com/browse/UCpZA8rufjU5pHypV5FhlQOw","monetizationType":"FLATRATE","package":{"packageId":2528,"clearName":"YouTube TV","icon":"/icon/334102416/{profile}/youtubetv.{format}"}}
```

Offers may repeat for different presentation formats. Keep the distinct
service and offer types. Treat GraphQL `errors` as a failed lookup even
when the HTTP status is 200. A title lookup's `NOT_FOUND` error falls back
to search. Preserve the source path for lookup and use the returned
`content.fullPath` for the selected market. For example, the UK uses
`/uk/` URLs with the `GB` country code, and Japan may return a localized path.
