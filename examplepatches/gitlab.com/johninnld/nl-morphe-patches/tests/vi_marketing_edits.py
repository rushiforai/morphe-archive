"""Only the two source-owned marketing regions are restored for graph checks."""
from vi_marketing_contracts import RESPONSE,UI,RENDER,FILTER

EDITS=[
    {'owner':RESPONSE,'signature':'getItems()Ljava/util/List;','index':1,'original':[],
     'replacement':['invoke-static {p0}, '+RESPONSE+'->'+FILTER,'move-result-object p0']},
    {'owner':UI,'signature':RENDER,'index':0,'original':[],'replacement':['return-void']},
]
