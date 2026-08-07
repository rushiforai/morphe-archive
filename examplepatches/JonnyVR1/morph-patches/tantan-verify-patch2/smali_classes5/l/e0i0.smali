.class public final synthetic Ll/e0i0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/wzh0$d$a;

.field public final synthetic b:Ll/wzh0$d$a;

.field public final synthetic c:I

.field public final synthetic d:I


# direct methods
.method public synthetic constructor <init>(Ll/wzh0$d$a;Ll/wzh0$d$a;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e0i0;->a:Ll/wzh0$d$a;

    iput-object p2, p0, Ll/e0i0;->b:Ll/wzh0$d$a;

    iput p3, p0, Ll/e0i0;->c:I

    iput p4, p0, Ll/e0i0;->d:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/e0i0;->a:Ll/wzh0$d$a;

    iget-object v1, p0, Ll/e0i0;->b:Ll/wzh0$d$a;

    iget v2, p0, Ll/e0i0;->c:I

    iget p0, p0, Ll/e0i0;->d:I

    check-cast p1, Ll/pf60;

    invoke-static {v0, v1, v2, p0, p1}, Ll/wzh0$d$a;->c(Ll/wzh0$d$a;Ll/wzh0$d$a;IILl/pf60;)V

    return-void
.end method
