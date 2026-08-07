.class public final synthetic Ll/mmt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/pmt;


# direct methods
.method public synthetic constructor <init>(Ll/pmt;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mmt;->a:Ll/pmt;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mmt;->a:Ll/pmt;

    check-cast p1, Ljava/lang/Throwable;

    invoke-virtual {p0, p1}, Ll/pmt;->T2(Ljava/lang/Throwable;)V

    return-void
.end method
