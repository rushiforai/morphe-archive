.class public final synthetic Ll/zax;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/xbx;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Ll/xbx;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zax;->a:Ll/xbx;

    iput-object p2, p0, Ll/zax;->b:Ljava/lang/String;

    iput-boolean p3, p0, Ll/zax;->c:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zax;->a:Ll/xbx;

    iget-object v1, p0, Ll/zax;->b:Ljava/lang/String;

    iget-boolean p0, p0, Ll/zax;->c:Z

    invoke-static {v0, v1, p0}, Ll/xbx;->F0(Ll/xbx;Ljava/lang/String;Z)V

    return-void
.end method
