.class public final synthetic Ll/zoo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/apo;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/apo;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zoo;->a:Ll/apo;

    iput p2, p0, Ll/zoo;->b:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zoo;->a:Ll/apo;

    iget p0, p0, Ll/zoo;->b:I

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Ll/apo;->N0(Ll/apo;ILjava/lang/Throwable;)V

    return-void
.end method
