.class public final Le/e/a/DynamicTheme$Refresh;
.super Ljava/lang/Object;
.source "DynamicTheme.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceClickListener;


# instance fields
.field private final activity:Landroid/app/Activity;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/DynamicTheme$Refresh;->activity:Landroid/app/Activity;

    return-void
.end method


# virtual methods
.method public onPreferenceClick(Landroid/preference/Preference;)Z
    .registers 3

    iget-object v0, p0, Le/e/a/DynamicTheme$Refresh;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->recreate()V

    const/4 v0, 0x0

    return v0
.end method
