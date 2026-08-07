.class public final synthetic Ll/o4g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/r4g;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/r4g;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/o4g;->a:Ll/r4g;

    iput p2, p0, Ll/o4g;->b:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/o4g;->a:Ll/r4g;

    iget p0, p0, Ll/o4g;->b:I

    check-cast p1, Ll/uxj0;

    invoke-static {v0, p0, p1}, Ll/r4g;->g0(Ll/r4g;ILl/uxj0;)V

    return-void
.end method
