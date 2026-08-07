.class public final synthetic Ll/ocl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/tcl0;

.field public final synthetic b:Ll/vdl0;


# direct methods
.method public synthetic constructor <init>(Ll/tcl0;Ll/vdl0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ocl0;->a:Ll/tcl0;

    iput-object p2, p0, Ll/ocl0;->b:Ll/vdl0;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ocl0;->a:Ll/tcl0;

    iget-object p0, p0, Ll/ocl0;->b:Ll/vdl0;

    invoke-static {v0, p0}, Ll/tcl0;->b(Ll/tcl0;Ll/vdl0;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
