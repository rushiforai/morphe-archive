.class public final synthetic Ll/bvv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/mvv;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/mvv;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bvv;->a:Ll/mvv;

    iput p2, p0, Ll/bvv;->b:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bvv;->a:Ll/mvv;

    iget p0, p0, Ll/bvv;->b:I

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, p0, p1}, Ll/mvv;->E4(Ll/mvv;ILjava/lang/Long;)V

    return-void
.end method
