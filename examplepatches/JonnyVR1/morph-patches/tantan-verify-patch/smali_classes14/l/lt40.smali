.class public final synthetic Ll/lt40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ot40;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/ot40;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lt40;->a:Ll/ot40;

    iput p2, p0, Ll/lt40;->b:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lt40;->a:Ll/ot40;

    iget p0, p0, Ll/lt40;->b:I

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {v0, p0, p1}, Ll/ot40;->d(Ll/ot40;ILcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method
