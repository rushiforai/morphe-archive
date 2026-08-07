.class public final synthetic Ll/hww;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/sww;

.field public final synthetic b:Landroid/app/SearchableInfo;


# direct methods
.method public synthetic constructor <init>(Ll/sww;Landroid/app/SearchableInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hww;->a:Ll/sww;

    iput-object p2, p0, Ll/hww;->b:Landroid/app/SearchableInfo;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hww;->a:Ll/sww;

    iget-object p0, p0, Ll/hww;->b:Landroid/app/SearchableInfo;

    invoke-static {v0, p0}, Ll/sww;->e(Ll/sww;Landroid/app/SearchableInfo;)V

    return-void
.end method
