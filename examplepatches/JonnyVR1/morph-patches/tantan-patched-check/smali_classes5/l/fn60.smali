.class public final synthetic Ll/fn60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/jn60;

.field public final synthetic b:Ll/in60;

.field public final synthetic c:I

.field public final synthetic d:Ll/l5;


# direct methods
.method public synthetic constructor <init>(Ll/jn60;Ll/in60;ILl/l5;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fn60;->a:Ll/jn60;

    iput-object p2, p0, Ll/fn60;->b:Ll/in60;

    iput p3, p0, Ll/fn60;->c:I

    iput-object p4, p0, Ll/fn60;->d:Ll/l5;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/fn60;->a:Ll/jn60;

    iget-object v1, p0, Ll/fn60;->b:Ll/in60;

    iget v2, p0, Ll/fn60;->c:I

    iget-object p0, p0, Ll/fn60;->d:Ll/l5;

    invoke-static {v0, v1, v2, p0}, Ll/in60;->e(Ll/jn60;Ll/in60;ILl/l5;)V

    return-void
.end method
