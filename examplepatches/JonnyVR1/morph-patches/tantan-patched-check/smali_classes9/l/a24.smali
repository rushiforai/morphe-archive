.class public final synthetic Ll/a24;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/b24;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/b24;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a24;->a:Ll/b24;

    iput p2, p0, Ll/a24;->b:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/a24;->a:Ll/b24;

    iget p0, p0, Ll/a24;->b:I

    check-cast p1, Ll/b24$a;

    invoke-static {v0, p0, p1}, Ll/b24;->h(Ll/b24;ILl/b24$a;)V

    return-void
.end method
