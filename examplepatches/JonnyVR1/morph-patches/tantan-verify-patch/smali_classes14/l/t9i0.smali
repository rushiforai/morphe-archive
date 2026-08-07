.class public final synthetic Ll/t9i0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/a30;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/Throwable;

    check-cast p2, Ljava/lang/String;

    check-cast p3, Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;

    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/app/TantanApp;->b(Ljava/lang/Throwable;Ljava/lang/String;Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;)V

    return-void
.end method
