.class public final synthetic Ll/cu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qn50;


# instance fields
.field public final synthetic a:Ll/du;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/du;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cu;->a:Ll/du;

    iput-boolean p2, p0, Ll/cu;->b:Z

    return-void
.end method


# virtual methods
.method public final a(Lcom/flipboard/bottomsheet/BottomSheetLayout;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cu;->a:Ll/du;

    iget-boolean p0, p0, Ll/cu;->b:Z

    invoke-static {v0, p0, p1}, Ll/du;->c(Ll/du;ZLcom/flipboard/bottomsheet/BottomSheetLayout;)V

    return-void
.end method
