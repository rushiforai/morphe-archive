.class public Lcom/xiaomi/push/service/al;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/xiaomi/push/service/XMPushService$n;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/push/service/al$a;
    }
.end annotation


# static fields
.field private static a:Lcom/xiaomi/push/service/al$a;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    sget-object p0, Lcom/xiaomi/push/service/al;->a:Lcom/xiaomi/push/service/al$a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/xiaomi/push/service/al$a;->a()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
