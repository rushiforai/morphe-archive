.class public final synthetic Ll/ya4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/fb4;

.field public final synthetic b:Ll/ib4$l;


# direct methods
.method public synthetic constructor <init>(Ll/fb4;Ll/ib4$l;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ya4;->a:Ll/fb4;

    iput-object p2, p0, Ll/ya4;->b:Ll/ib4$l;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ya4;->a:Ll/fb4;

    iget-object p0, p0, Ll/ya4;->b:Ll/ib4$l;

    invoke-static {v0, p0}, Ll/fb4;->E(Ll/fb4;Ll/ib4$l;)V

    return-void
.end method
