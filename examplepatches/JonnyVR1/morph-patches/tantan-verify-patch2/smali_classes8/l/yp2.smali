.class public final synthetic Ll/yp2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ll/bq2;


# direct methods
.method public synthetic constructor <init>(ILl/bq2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/yp2;->a:I

    iput-object p2, p0, Ll/yp2;->b:Ll/bq2;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget v0, p0, Ll/yp2;->a:I

    iget-object p0, p0, Ll/yp2;->b:Ll/bq2;

    invoke-static {v0, p0, p1}, Ll/bq2;->Y0(ILl/bq2;Ljava/lang/Object;)V

    return-void
.end method
