.class public final synthetic Ll/gud;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/hud;

.field public final synthetic b:Ll/z06;

.field public final synthetic c:Ll/yk90;


# direct methods
.method public synthetic constructor <init>(Ll/hud;Ll/z06;Ll/yk90;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gud;->a:Ll/hud;

    iput-object p2, p0, Ll/gud;->b:Ll/z06;

    iput-object p3, p0, Ll/gud;->c:Ll/yk90;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gud;->a:Ll/hud;

    iget-object v1, p0, Ll/gud;->b:Ll/z06;

    iget-object p0, p0, Ll/gud;->c:Ll/yk90;

    invoke-static {v0, v1, p0}, Ll/hud;->c(Ll/hud;Ll/z06;Ll/yk90;)V

    return-void
.end method
