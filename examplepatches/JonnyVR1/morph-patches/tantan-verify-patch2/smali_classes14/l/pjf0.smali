.class public final synthetic Ll/pjf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/ujf0;


# direct methods
.method public synthetic constructor <init>(Ll/ujf0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pjf0;->a:Ll/ujf0;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pjf0;->a:Ll/ujf0;

    invoke-static {p0}, Ll/ujf0;->W0(Ll/ujf0;)Ljava/lang/Double;

    move-result-object p0

    return-object p0
.end method
