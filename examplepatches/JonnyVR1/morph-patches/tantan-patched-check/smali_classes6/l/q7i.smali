.class public final synthetic Ll/q7i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/t7i;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/t7i;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q7i;->a:Ll/t7i;

    iput p2, p0, Ll/q7i;->b:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q7i;->a:Ll/t7i;

    iget p0, p0, Ll/q7i;->b:I

    check-cast p1, [I

    invoke-static {v0, p0, p1}, Ll/t7i;->D(Ll/t7i;I[I)V

    return-void
.end method
