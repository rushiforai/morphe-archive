.class public final synthetic Ll/xa4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/fb4;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/fb4;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xa4;->a:Ll/fb4;

    iput-boolean p2, p0, Ll/xa4;->b:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xa4;->a:Ll/fb4;

    iget-boolean p0, p0, Ll/xa4;->b:Z

    invoke-static {v0, p0}, Ll/fb4;->J(Ll/fb4;Z)V

    return-void
.end method
