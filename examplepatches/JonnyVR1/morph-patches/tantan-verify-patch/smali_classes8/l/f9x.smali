.class public final synthetic Ll/f9x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/g9x;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/g9x;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f9x;->a:Ll/g9x;

    iput p2, p0, Ll/f9x;->b:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/f9x;->a:Ll/g9x;

    iget p0, p0, Ll/f9x;->b:I

    check-cast p1, [I

    invoke-static {v0, p0, p1}, Ll/g9x;->f(Ll/g9x;I[I)V

    return-void
.end method
