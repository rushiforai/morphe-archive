.class public final synthetic Ll/gn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/pn0$a;

.field public final synthetic b:I

.field public final synthetic c:J

.field public final synthetic d:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/pn0$a;IJLl/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gn0;->a:Ll/pn0$a;

    iput p2, p0, Ll/gn0;->b:I

    iput-wide p3, p0, Ll/gn0;->c:J

    iput-object p5, p0, Ll/gn0;->d:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/gn0;->a:Ll/pn0$a;

    iget v1, p0, Ll/gn0;->b:I

    iget-wide v2, p0, Ll/gn0;->c:J

    iget-object p0, p0, Ll/gn0;->d:Ll/x20;

    invoke-static {v0, v1, v2, v3, p0}, Ll/pn0;->e(Ll/pn0$a;IJLl/x20;)V

    return-void
.end method
