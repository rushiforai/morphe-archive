.class public final synthetic Ll/kqg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/yqg0;

.field public final synthetic b:[B


# direct methods
.method public synthetic constructor <init>(Ll/yqg0;[B)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kqg0;->a:Ll/yqg0;

    iput-object p2, p0, Ll/kqg0;->b:[B

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kqg0;->a:Ll/yqg0;

    iget-object p0, p0, Ll/kqg0;->b:[B

    invoke-virtual {v0, p0}, Ll/yqg0;->h([B)V

    return-void
.end method
