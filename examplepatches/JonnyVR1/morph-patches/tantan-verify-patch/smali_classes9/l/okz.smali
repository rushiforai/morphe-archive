.class public final synthetic Ll/okz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/clz;

.field public final synthetic b:I

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/clz;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/okz;->a:Ll/clz;

    iput p2, p0, Ll/okz;->b:I

    iput-object p3, p0, Ll/okz;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/okz;->a:Ll/clz;

    iget v1, p0, Ll/okz;->b:I

    iget-object p0, p0, Ll/okz;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Ll/clz;->v1(Ll/clz;ILjava/lang/String;)V

    return-void
.end method
