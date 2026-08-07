.class public final synthetic Ll/d9z;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ll/clz;


# direct methods
.method public synthetic constructor <init>(ILl/clz;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/d9z;->a:I

    iput-object p2, p0, Ll/d9z;->b:Ll/clz;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget v0, p0, Ll/d9z;->a:I

    iget-object p0, p0, Ll/d9z;->b:Ll/clz;

    invoke-static {v0, p0, p1}, Ll/nbz;->Q0(ILl/clz;Ljava/lang/Object;)V

    return-void
.end method
