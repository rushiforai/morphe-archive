.class public final synthetic Ll/z810;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ll/e910;


# direct methods
.method public synthetic constructor <init>(ILl/e910;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/z810;->a:I

    iput-object p2, p0, Ll/z810;->b:Ll/e910;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget v0, p0, Ll/z810;->a:I

    iget-object p0, p0, Ll/z810;->b:Ll/e910;

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, p0, p1}, Ll/e910;->P3(ILl/e910;Ljava/lang/Long;)V

    return-void
.end method
