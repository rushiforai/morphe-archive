.class public final synthetic Ll/kc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/pc;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/pc;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kc;->a:Ll/pc;

    iput p2, p0, Ll/kc;->b:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kc;->a:Ll/pc;

    iget p0, p0, Ll/kc;->b:I

    check-cast p1, Ll/uwl;

    invoke-static {v0, p0, p1}, Ll/pc;->V3(Ll/pc;ILl/uwl;)V

    return-void
.end method
