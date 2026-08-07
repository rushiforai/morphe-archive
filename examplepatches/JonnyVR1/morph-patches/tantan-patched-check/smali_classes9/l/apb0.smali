.class public final synthetic Ll/apb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/cpb0;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/cpb0;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/apb0;->a:Ll/cpb0;

    iput p2, p0, Ll/apb0;->b:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/apb0;->a:Ll/cpb0;

    iget p0, p0, Ll/apb0;->b:I

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Ll/cpb0;->R3(Ll/cpb0;ILjava/lang/Throwable;)V

    return-void
.end method
