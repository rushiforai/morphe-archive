.class public final synthetic Ll/na4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/fb4;

.field public final synthetic b:Ll/nx3;


# direct methods
.method public synthetic constructor <init>(Ll/fb4;Ll/nx3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/na4;->a:Ll/fb4;

    iput-object p2, p0, Ll/na4;->b:Ll/nx3;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/na4;->a:Ll/fb4;

    iget-object p0, p0, Ll/na4;->b:Ll/nx3;

    invoke-static {v0, p0}, Ll/fb4;->q(Ll/fb4;Ll/nx3;)V

    return-void
.end method
