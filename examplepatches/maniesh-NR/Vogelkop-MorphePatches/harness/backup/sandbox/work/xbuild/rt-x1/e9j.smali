.class public final Le9j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final a:Lcom/opera/android/widget/MenuSettingsListItem;


# direct methods
.method public constructor <init>(Lcom/opera/android/widget/MenuSettingsListItem;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le9j;->a:Lcom/opera/android/widget/MenuSettingsListItem;

    return-void
.end method


# virtual methods
.method public final getRoot()Landroid/view/View;
    .registers 1

    iget-object p0, p0, Le9j;->a:Lcom/opera/android/widget/MenuSettingsListItem;

    return-object p0
.end method
