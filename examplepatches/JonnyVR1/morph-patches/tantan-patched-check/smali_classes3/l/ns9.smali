.class public final synthetic Ll/ns9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/cwl;


# direct methods
.method public synthetic constructor <init>(Ll/cwl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ns9;->a:Ll/cwl;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ns9;->a:Ll/cwl;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/module/CoreMemberBusinessServiceImpl;->F(Ll/cwl;)V

    return-void
.end method
