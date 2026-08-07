.class public final synthetic Ll/ayn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/qyn;

.field public final synthetic b:Ll/f7s;


# direct methods
.method public synthetic constructor <init>(Ll/qyn;Ll/f7s;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ayn;->a:Ll/qyn;

    iput-object p2, p0, Ll/ayn;->b:Ll/f7s;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ayn;->a:Ll/qyn;

    iget-object p0, p0, Ll/ayn;->b:Ll/f7s;

    invoke-static {v0, p0}, Ll/qyn;->j3(Ll/qyn;Ll/f7s;)V

    return-void
.end method
