.class public final synthetic Ll/ghd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/uhd0;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/uhd0;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ghd0;->a:Ll/uhd0;

    iput p2, p0, Ll/ghd0;->b:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ghd0;->a:Ll/uhd0;

    iget p0, p0, Ll/ghd0;->b:I

    check-cast p1, Ll/ugd0;

    invoke-static {v0, p0, p1}, Ll/uhd0;->f4(Ll/uhd0;ILl/ugd0;)V

    return-void
.end method
