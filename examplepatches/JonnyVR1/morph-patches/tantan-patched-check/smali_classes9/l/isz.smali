.class public final synthetic Ll/isz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/tvz;


# direct methods
.method public synthetic constructor <init>(Ll/tvz;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/isz;->a:Ll/tvz;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/isz;->a:Ll/tvz;

    invoke-static {p0}, Ll/tvz;->Kb(Ll/tvz;)V

    return-void
.end method
