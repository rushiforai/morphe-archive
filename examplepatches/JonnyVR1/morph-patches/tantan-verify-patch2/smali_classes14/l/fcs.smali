.class public final synthetic Ll/fcs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ics;


# direct methods
.method public synthetic constructor <init>(Ll/ics;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fcs;->a:Ll/ics;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fcs;->a:Ll/ics;

    invoke-static {p0}, Ll/ics;->U2(Ll/ics;)V

    return-void
.end method
