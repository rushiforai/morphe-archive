.class public final synthetic Ll/y0y;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qn50;


# instance fields
.field public final synthetic a:Ll/z0y;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/z0y;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y0y;->a:Ll/z0y;

    iput-boolean p2, p0, Ll/y0y;->b:Z

    return-void
.end method


# virtual methods
.method public final a(Lcom/flipboard/bottomsheet/BottomSheetLayout;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/y0y;->a:Ll/z0y;

    iget-boolean p0, p0, Ll/y0y;->b:Z

    invoke-static {v0, p0, p1}, Ll/z0y;->c(Ll/z0y;ZLcom/flipboard/bottomsheet/BottomSheetLayout;)V

    return-void
.end method
