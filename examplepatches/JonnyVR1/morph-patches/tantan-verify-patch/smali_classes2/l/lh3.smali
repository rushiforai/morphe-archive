.class public final synthetic Ll/lh3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rkq0;


# instance fields
.field public final synthetic a:Ll/n0f;

.field public final synthetic b:Ll/mh3;


# direct methods
.method public synthetic constructor <init>(Ll/n0f;Ll/mh3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lh3;->a:Ll/n0f;

    iput-object p2, p0, Ll/lh3;->b:Ll/mh3;

    return-void
.end method


# virtual methods
.method public final a(Ljava/io/OutputStream;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lh3;->a:Ll/n0f;

    iget-object p0, p0, Ll/lh3;->b:Ll/mh3;

    invoke-static {v0, p0, p1}, Ll/mh3;->a(Ll/n0f;Ll/mh3;Ljava/io/OutputStream;)V

    return-void
.end method
