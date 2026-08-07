.class public final synthetic Ll/adi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/pdi;


# direct methods
.method public synthetic constructor <init>(Ll/pdi;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/adi;->a:Ll/pdi;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/adi;->a:Ll/pdi;

    invoke-static {p0}, Ll/pdi;->j(Ll/pdi;)V

    return-void
.end method
