.class public final synthetic Ll/itb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/mtb0;


# direct methods
.method public synthetic constructor <init>(Ll/mtb0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/itb0;->a:Ll/mtb0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/itb0;->a:Ll/mtb0;

    invoke-virtual {p0}, Ll/mtb0;->v0()V

    return-void
.end method
