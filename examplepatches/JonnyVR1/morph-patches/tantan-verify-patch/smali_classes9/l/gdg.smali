.class public final synthetic Ll/gdg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/idg;


# direct methods
.method public synthetic constructor <init>(Ll/idg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gdg;->a:Ll/idg;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gdg;->a:Ll/idg;

    invoke-static {p0}, Ll/idg;->j4(Ll/idg;)V

    return-void
.end method
