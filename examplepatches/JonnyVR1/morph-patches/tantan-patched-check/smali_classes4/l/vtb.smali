.class public final synthetic Ll/vtb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/lang/Throwable;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vtb;->a:Ljava/lang/Throwable;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vtb;->a:Ljava/lang/Throwable;

    check-cast p1, Ll/uxj0;

    invoke-static {p0, p1}, Lcom/tantanapp/common/utils/CrashHelper;->a(Ljava/lang/Throwable;Ll/uxj0;)V

    return-void
.end method
