.class public final synthetic Ll/j9n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/k9n;


# direct methods
.method public synthetic constructor <init>(Ll/k9n;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j9n;->a:Ll/k9n;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j9n;->a:Ll/k9n;

    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/e$b;

    invoke-static {p0, p1}, Ll/k9n;->J3(Ll/k9n;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/e$b;)V

    return-void
.end method
