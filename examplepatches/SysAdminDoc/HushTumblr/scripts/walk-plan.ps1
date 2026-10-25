<# Required destinations for a walk. These checks prove navigation, not every account/server feature. #>
function Get-WalkPlan {
    param([string[]]$PatchNames)
    $root = 'com.tumblr/.ui.activity.RootActivity'
    @(
        [pscustomobject]@{ id = 'native.home'; link = ''; activity = $root; ids = @('root_activity_layout', 't_logo'); marker = ''; value = '' },
        [pscustomobject]@{ id = 'native.explore'; link = 'https://www.tumblr.com/explore'; activity = $root; ids = @('explore_title', 'search_bar'); marker = 'explore'; value = 'Explore' },
        [pscustomobject]@{ id = 'native.search'; link = 'https://www.tumblr.com/search/art'; activity = 'com.tumblr/.ui.activity.SearchActivity'; ids = @('search_activity_root_container', 'post_type_button', 'time_range_button'); marker = 'query'; value = 'art' },
        [pscustomobject]@{ id = 'native.tag'; link = 'https://www.tumblr.com/tagged/art'; activity = 'com.tumblr/.communityhubs.CommunityHubActivity'; ids = @('hubContainerLayout', 'hubViewPager'); marker = 'tag'; value = 'art' },
        [pscustomobject]@{ id = 'native.blog'; link = 'https://staff.tumblr.com/'; activity = 'com.tumblr/.ui.activity.BlogPagesActivity'; ids = @('blog_header_fragment_frame', 'root_blog_pages_container'); marker = 'blog-posts'; value = 'Posts' },
        [pscustomobject]@{ id = 'native.likes'; link = 'https://www.tumblr.com/likes'; activity = $root; ids = @('likes_sort_header_root', 'blog_pages_container'); marker = ''; value = '' }
    )
    if ($PatchNames -ccontains 'HushTumblr settings') {
        [pscustomobject]@{ id = 'settings.home'; page = ''; activity = $root; ids = @(); marker = ''; value = '' }
        $pages = [ordered]@{ feed = 'Feed'; posts = 'Posts'; interface = 'Interface'; privacy = 'Privacy'; links = 'Links'
            notifications = 'Notifications'; native = "Tumblr's own settings"; updates = 'Updates'
            tools = 'Pause, backup and diagnostics'; about = 'About' }
        foreach ($key in $pages.Keys) {
            [pscustomobject]@{ id = "settings.$key"; page = $pages[$key]; activity = $root; ids = @(); marker = ''; value = '' }
        }
    }
}

function Get-WalkObservation {
    param($Route, $Nodes, [string]$Activity)
    $own = @($Nodes | Where-Object { $_.Package -ceq 'com.tumblr' })
    $ids = @($own | Where-Object { $_.ResourceId } | ForEach-Object { $_.ResourceId } | Sort-Object -Unique)
    $marker = ''
    $markerId = switch ($Route.marker) {
        'explore' { 'explore_title' }
        'query' { 'searchable_action_bar' }
        'tag' { 'collapsibleToolbar' }
        'blog-posts' { 'title' }
    }
    if ($markerId) {
        $candidates = @($own | Where-Object { $_.ResourceId -ceq "com.tumblr:id/$markerId" })
        if ($Route.marker -eq 'blog-posts') { $candidates = @($candidates | Where-Object { $_.Selected }) }
        if ($candidates.Count -eq 1) {
            $marker = if ($Route.marker -eq 'tag') { $candidates[0].Description } else { $candidates[0].Text }
        }
    }
    # Store only the expected public marker, never a search draft, account name or post body.
    $markerMatches = $marker -ceq $Route.value
    $blocked = @($ids | Where-Object { $_ -cmatch ':id/(?:login|signup|sign_up|error_message|error_text|retry_button|no_connection)(?:_|$)' }).Count -gt 0
    $settingsLanding = @($own | Where-Object { $_.Text -ceq 'Search settings' }).Count -eq 1
    $page = $false
    if ($Route.page) { $page = @($own | Where-Object { $_.Text -ceq $Route.page }).Count -eq 1 }
    return [ordered]@{ activity = $Activity; resourceIds = @($ids); markerMatches = [bool]$markerMatches
        markerValue = if ($markerMatches) { $Route.value } else { '' }
        blocked = [bool]$blocked; settingsHome = [bool]$settingsLanding; pageTitleMatches = [bool]$page }
}

function Test-WalkDestination {
    param($Route, $Observation)
    if ($null -eq $Observation -or $Observation.activity -isnot [string] -or $Observation.activity -cne $Route.activity -or
        $Observation.blocked -isnot [bool] -or $Observation.blocked -or $Observation.resourceIds -isnot [array] -or
        @($Observation.resourceIds | Where-Object { $_ -isnot [string] }).Count -gt 0) { return $false }
    foreach ($id in @($Route.ids)) {
        if (@($Observation.resourceIds) -cnotcontains "com.tumblr:id/$id") { return $false }
    }
    if ($Route.marker -and ($Observation.markerMatches -isnot [bool] -or -not $Observation.markerMatches -or
        $Observation.markerValue -isnot [string] -or $Observation.markerValue -cne $Route.value)) { return $false }
    if ($Route.id -ceq 'settings.home') { return $Observation.settingsHome -is [bool] -and $Observation.settingsHome }
    if ($Route.id.StartsWith('settings.', [StringComparison]::Ordinal)) {
        return $Observation.settingsHome -is [bool] -and -not $Observation.settingsHome -and
            $Observation.pageTitleMatches -is [bool] -and $Observation.pageTitleMatches
    }
    return $true
}

function Test-WalkCoverage {
    param([AllowNull()][object[]]$Routes, [string[]]$PatchNames)
    $plan = @(Get-WalkPlan -PatchNames $PatchNames)
    $required = @($plan | ForEach-Object { $_.id })
    $seen = @{}
    foreach ($route in @($Routes)) {
        if ($null -eq $route -or $route.id -isnot [string] -or $required -cnotcontains $route.id -or $seen.ContainsKey($route.id)) {
            return [pscustomobject]@{ Complete = $false; Invalid = $true; Reason = 'duplicate, unknown or malformed route' }
        }
        $seen[$route.id] = $true
        $definition = @($plan | Where-Object { $_.id -ceq $route.id })[0]
        if ($route.status -cne 'PASS' -or -not (Test-WalkDestination -Route $definition -Observation $route.observation)) {
            return [pscustomobject]@{ Complete = $false; Invalid = $true; Reason = "unverified or wrong destination at $($route.id)" }
        }
    }
    return [pscustomobject]@{ Complete = $seen.Count -eq $required.Count; Invalid = $false; Reason = 'required routes are missing' }
}
