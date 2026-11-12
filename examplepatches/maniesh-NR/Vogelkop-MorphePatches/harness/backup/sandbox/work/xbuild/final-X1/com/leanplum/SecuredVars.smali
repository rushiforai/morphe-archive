.class public Lcom/leanplum/SecuredVars;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private json:Ljava/lang/String;

.field private signature:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/leanplum/SecuredVars;->json:Ljava/lang/String;

    iput-object p2, p0, Lcom/leanplum/SecuredVars;->signature:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getJson()Ljava/lang/String;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object p0, p0, Lcom/leanplum/SecuredVars;->json:Ljava/lang/String;

    return-object p0
.end method

.method public getSignature()Ljava/lang/String;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object p0, p0, Lcom/leanplum/SecuredVars;->signature:Ljava/lang/String;

    return-object p0
.end method
