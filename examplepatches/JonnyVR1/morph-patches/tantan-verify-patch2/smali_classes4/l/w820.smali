.class public final synthetic Ll/w820;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/f920;

.field public final synthetic b:Ll/iq40;


# direct methods
.method public synthetic constructor <init>(Ll/f920;Ll/iq40;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w820;->a:Ll/f920;

    iput-object p2, p0, Ll/w820;->b:Ll/iq40;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/w820;->a:Ll/f920;

    iget-object p0, p0, Ll/w820;->b:Ll/iq40;

    invoke-static {v0, p0}, Ll/f920;->v(Ll/f920;Ll/iq40;)V

    return-void
.end method
