.class public final synthetic Ll/rff0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/mgf0;


# direct methods
.method public synthetic constructor <init>(Ll/mgf0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rff0;->a:Ll/mgf0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rff0;->a:Ll/mgf0;

    invoke-static {p0}, Ll/mgf0;->I(Ll/mgf0;)V

    return-void
.end method
