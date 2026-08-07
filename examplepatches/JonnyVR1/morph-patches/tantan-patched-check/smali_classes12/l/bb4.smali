.class public final synthetic Ll/bb4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/fb4;

.field public final synthetic b:Ll/jt2;


# direct methods
.method public synthetic constructor <init>(Ll/fb4;Ll/jt2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bb4;->a:Ll/fb4;

    iput-object p2, p0, Ll/bb4;->b:Ll/jt2;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bb4;->a:Ll/fb4;

    iget-object p0, p0, Ll/bb4;->b:Ll/jt2;

    invoke-static {v0, p0}, Ll/fb4;->I(Ll/fb4;Ll/jt2;)V

    return-void
.end method
