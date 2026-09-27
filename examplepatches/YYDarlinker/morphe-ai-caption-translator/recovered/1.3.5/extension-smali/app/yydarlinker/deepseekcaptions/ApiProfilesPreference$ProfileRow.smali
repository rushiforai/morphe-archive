.class final Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;
.super Ljava/lang/Object;
.source "ApiProfilesPreference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "ProfileRow"
.end annotation


# instance fields
.field final header:Landroid/widget/LinearLayout;

.field final id:Ljava/lang/String;

.field final more:Landroid/widget/ImageButton;

.field final name:Landroid/widget/TextView;

.field final panel:Landroid/widget/LinearLayout;

.field final root:Landroid/widget/LinearLayout;

.field final synthetic this$0:Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;


# direct methods
.method constructor <init>(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;Ljava/lang/String;)V
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x0
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 30
    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->this$0:Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->-$$Nest$mcolumn(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;)Landroid/widget/LinearLayout;

    move-result-object v0

    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->root:Landroid/widget/LinearLayout;

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->header:Landroid/widget/LinearLayout;

    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->-$$Nest$mcolumn(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;)Landroid/widget/LinearLayout;

    move-result-object v0

    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->panel:Landroid/widget/LinearLayout;

    .line 28
    new-instance v0, Landroid/widget/TextView;

    invoke-virtual {p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->name:Landroid/widget/TextView;

    .line 29
    new-instance v0, Landroid/widget/ImageButton;

    invoke-virtual {p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {v0, p1}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->more:Landroid/widget/ImageButton;

    .line 30
    iput-object p2, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$ProfileRow;->id:Ljava/lang/String;

    return-void
.end method
