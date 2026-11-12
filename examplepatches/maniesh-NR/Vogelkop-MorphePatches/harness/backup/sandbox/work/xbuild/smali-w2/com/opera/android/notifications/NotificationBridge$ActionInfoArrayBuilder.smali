.class public Lcom/opera/android/notifications/NotificationBridge$ActionInfoArrayBuilder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/opera/android/notifications/NotificationBridge;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ActionInfoArrayBuilder"
.end annotation


# instance fields
.field public final a:[Lcom/opera/android/notifications/NotificationBridge$ActionInfo;


# direct methods
.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-array p1, p1, [Lcom/opera/android/notifications/NotificationBridge$ActionInfo;

    iput-object p1, p0, Lcom/opera/android/notifications/NotificationBridge$ActionInfoArrayBuilder;->a:[Lcom/opera/android/notifications/NotificationBridge$ActionInfo;

    return-void
.end method


# virtual methods
.method public final getArray()[Lcom/opera/android/notifications/NotificationBridge$ActionInfo;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/notifications/NotificationBridge$ActionInfoArrayBuilder;->a:[Lcom/opera/android/notifications/NotificationBridge$ActionInfo;

    return-object p0
.end method

.method public final set(ILjava/lang/String;Landroid/graphics/Bitmap;ILjava/lang/String;)V
    .registers 12
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/graphics/Bitmap;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Lcom/opera/android/notifications/a;

    move-object v1, p0

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/opera/android/notifications/a;-><init>(Lcom/opera/android/notifications/NotificationBridge$ActionInfoArrayBuilder;Ljava/lang/String;Landroid/graphics/Bitmap;ILjava/lang/String;)V

    iget-object p0, v1, Lcom/opera/android/notifications/NotificationBridge$ActionInfoArrayBuilder;->a:[Lcom/opera/android/notifications/NotificationBridge$ActionInfo;

    aput-object v0, p0, p1

    return-void
.end method
