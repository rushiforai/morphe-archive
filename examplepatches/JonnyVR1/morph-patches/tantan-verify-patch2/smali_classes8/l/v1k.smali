.class public final synthetic Ll/v1k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/x1k;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/x1k;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v1k;->a:Ll/x1k;

    iput p2, p0, Ll/v1k;->b:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/v1k;->a:Ll/x1k;

    iget p0, p0, Ll/v1k;->b:I

    check-cast p1, Ll/bkj0;

    invoke-static {v0, p0, p1}, Ll/x1k;->j0(Ll/x1k;ILl/bkj0;)V

    return-void
.end method
