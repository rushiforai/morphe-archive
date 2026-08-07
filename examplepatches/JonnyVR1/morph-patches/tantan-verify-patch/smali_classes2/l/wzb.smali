.class public final synthetic Ll/wzb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/IBinder$DeathRecipient;


# instance fields
.field public final synthetic a:Landroidx/browser/customtabs/CustomTabsService$a;

.field public final synthetic b:Ll/zzb;


# direct methods
.method public synthetic constructor <init>(Landroidx/browser/customtabs/CustomTabsService$a;Ll/zzb;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wzb;->a:Landroidx/browser/customtabs/CustomTabsService$a;

    iput-object p2, p0, Ll/wzb;->b:Ll/zzb;

    return-void
.end method


# virtual methods
.method public final binderDied()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wzb;->a:Landroidx/browser/customtabs/CustomTabsService$a;

    iget-object p0, p0, Ll/wzb;->b:Ll/zzb;

    invoke-static {v0, p0}, Landroidx/browser/customtabs/CustomTabsService$a;->Y2(Landroidx/browser/customtabs/CustomTabsService$a;Ll/zzb;)V

    return-void
.end method
