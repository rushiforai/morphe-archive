.class public final synthetic Ltv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lwx3;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lb2l;


# direct methods
.method public synthetic constructor <init>(Lb2l;B)V
    .registers 3

    iput-byte p2, p0, Ltv0;->a:B

    iput-object p1, p0, Ltv0;->b:Lb2l;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final o(Lb2l;)Lb2l;
    .registers 2

    iget-byte p1, p0, Ltv0;->a:B

    iget-object p0, p0, Ltv0;->b:Lb2l;

    return-object p0
.end method
